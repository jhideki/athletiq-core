import React, { useState, useEffect } from 'react';
import { supabase } from './supabaseClient'; // assuming you have a file named supabase.js exporting the initialized Supabase client

const TeamMembersList = ({ session, teamID }) => {
    const [teamMembers, setTeamMembers] = useState([]);

    useEffect(() => {
        const { user } = session
        async function fetchTeamMembers() {
            try {
                const { data, error } = await supabase.from('players').select('*').eq('team_id', teamID)
                if (error) {
                    throw error;
                }

                console.log(data);
                setTeamMembers(data);
            } catch (error) {
                console.error('Error fetching team members:', error.message);
            }
        }

        fetchTeamMembers();
    }, [session]);

    return (
        <div>
            <h2>Team Members</h2>
            <ul>
                {teamMembers.map(member => (
                    <li key={member.id}>player id:{member.id} player weight: {member.weight} player height: {member.height}</li>
                ))}
            </ul>
        </div>
    );
};

export default TeamMembersList;
