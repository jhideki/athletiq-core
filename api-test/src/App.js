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
    const [user, setUser] = useState(null);
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
    const [code, setCode] = useState("");
    const handleSubmit = (event) => {
        event.preventDefault();
        supabase.auth.getUser().then(({ data: { user } }) => {
            setUser(user);
            console.log(user);
            supabase
                .rpc("join_team", { code: code, user_id: user.id })
                .then(({ data, error }) => {
                    if (error) {
                        console.log(error);
                    } else {
                        console.log(data);
                    }
                });
        });

        //const {data, error} = await supabase.rpc('join_team', {team_code: code, user_id: supabase.auth.retreiveUser("JWT")})
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
                <div>
                    <form onSubmit={handleSubmit}>
                        <label htmlFor="textInput">Enter team code:</label>
                        <input
                            type="text"
                            id="textInput"
                            onChange={(event) => setCode(event.target.value)}
                        />
                        <button type="submit">Submit</button>
                    </form>
                </div>
            </div>
        );
    }
}

export default App;
