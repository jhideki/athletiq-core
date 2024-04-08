import { useState, useEffect } from 'react'
import { supabase } from './supabaseClient'
import TeamMembersList from './TeamMembers'
import Task from './Task'

export default function Dashboard({ session }) {
    const [loading, setLoading] = useState(true)
    const [firstName, setFirstName] = useState(null)
    const [lastName, setLastName] = useState(null)
    const [userType, setUserType] = useState(null)
    const [team, setTeam] = useState(null)
    const [teamID, setTeamID] = useState(null)

    useEffect(() => {
        let ignore = false
        async function getProfile() {
            setLoading(true)
            const { user } = session
            const { data, error } = await supabase
                .from('persons')
                .select(`first_name, last_name, user_type`)
                .eq('id', user.id)
                .single()

            if (!ignore) {
                if (error) {
                    console.log("error retreiving record")
                    console.warn(error)
                } else if (data) {
                    setFirstName(data.first_name)
                    setLastName(data.last_name)
                    setUserType(data.user_type)

                    if (data.user_type == 'coach') {
                        await getTeam(user)
                    }
                }
            }

            setLoading(false)
        }

        async function getTeam(user) {
            const { data, error } = await supabase.from('teams').select('name, id').eq('coach_id', user.id).single();
            if (!ignore) {
                if (error) {
                    console.log("error retreiving record")
                    console.warn(error)
                } else if (data) {
                    setTeam(data.name)
                    setTeamID(data.id)
                    console.log(data)
                }
            }
        }

        getProfile()

        return () => {
            ignore = true
        }
    }, [session])

    async function updateProfile(event) {
        event.preventDefault()

        setLoading(true)
        const { user } = session

        const updates = {
            firstName,
            lastName,
            userType
        }

        const { error } = await supabase.from('persons').update({ first_name: firstName, last_name: lastName, user_type: userType }).eq('id', user.id)

        if (error) {
            alert(error.message)
        } else {
            console.log("profile updated")
        }
        setLoading(false)
    }

    return (
        <div>
            <form onSubmit={updateProfile} className="form-widget">
                <div>
                    <label htmlFor="email">Email</label>
                    <input id="email" type="text" value={session.user.email} disabled />
                </div>
                <div>
                    <label htmlFor="firstname">First Name</label>
                    <input
                        id="firstName"
                        type="text"
                        required
                        value={firstName || ''}
                        onChange={(e) => setFirstName(e.target.value)}
                    />
                </div>
                <div>
                    <label htmlFor="lastName">Last Name</label>
                    <input
                        id="lastName"
                        type="text"
                        value={lastName || ''}
                        onChange={(e) => setLastName(e.target.value)}
                    />
                </div>

                <div>
                    <label htmlFor="userType">User type</label>
                    <input
                        id="userType"
                        type="text"
                        value={userType || ''}
                        onChange={(e) => setUserType(e.target.value)}
                    />
                </div>

                <div>
                    <button className="button block primary" type="submit" disabled={loading}>
                        {loading ? 'Loading ...' : 'Update'}
                    </button>
                </div>

                <div>
                    <button className="button block" type="button" onClick={() => supabase.auth.signOut()}>
                        Sign Out
                    </button>
                </div>
            </form>
            <div>
                {loading ? (<div>Loading team data... </div>) :
                    (<div>
                        <h2>Team name: {team}</h2>
                        {teamID && <TeamMembersList session={session} teamID={teamID} />}
                        {teamID && <Task session={session} teamID={teamID} />}
                    </div>)}
            </div>
        </div>
    )
}
