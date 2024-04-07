import './App.css'
import { useState, useEffect } from 'react'
import { supabase } from './supabaseClient'
import Dashboard from './Dashboard'
import { Auth } from "@supabase/auth-ui-react"

function App() {
    const [session, setSession] = useState(null)

    useEffect(() => {
        supabase.auth.getSession().then(({ data: { session } }) => {
            console.log(session.user.id)
            setSession(session)
        })

        supabase.auth.onAuthStateChange((_event, session) => {
            setSession(session)
        })
    }, [])

    return (
        <div className="container" style={{ padding: '50px 0 100px 0' }}>
            {!session ? <Auth supabaseClient={supabase} /> : <Dashboard key={session.user.id} session={session} />}
        </div>
    )
}

export default App
