import logo from "./logo.svg";
import "./App.css";
import { createClient } from "@supabase/supabase-js";
import { Auth } from "@supabase/auth-ui-react";
import { ThemeSupa } from "@supabase/auth-ui-shared";
import { useState, useEffect } from "react";

const supabase = createClient(
    "http://127.0.0.1:54321",
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0",
);

function App() {
    const [session, setSession] = useState(null);
    useEffect(() => {
        supabase.auth.getSession().then(({ data: { session } }) => {
            setSession(session);
        });

        const {
            data: { subscription },
        } = supabase.auth.onAuthStateChange((_event, session) => {
            setSession(session);
        });
        return () => subscription.unsubscribe();
    }, []);
    const handleLogout = async () => {
        const { error } = await supabase.auth.signOut();
        if (error) {
            console.log("error");
        }
    };

    if (!session) {
        return (
            <Auth supabaseClient={supabase} appearance={{ theme: ThemeSupa }} />
        );
    } else {
        return (
            <div>
                {" "}
                Logged in!
                <button onClick={handleLogout}>Log out</button>
                <div>Join team</div>
            </div>
        );
    }
}

export default App;
