import React, { useState, useEffect } from 'react';
import { supabase } from './supabaseClient'; // assuming you have a file named supabase.js exporting the initialized Supabase client

const TeamMembersList = () => {
    const [teamMembers, setTeamMembers] = useState([]);

    useEffect(() => {
        async function fetchTeamMembers() {
            try {
                const { data, error } = await supabase.from('players').select('*');
                if (error) {
                    throw error;
                }
                setTeamMembers(data);
            } catch (error) {
                console.error('Error fetching team members:', error.message);
            }
        }

        fetchTeamMembers();
    }, []);

    return (
        <div>
            <h2>Team Members</h2>
            <ul>
                {teamMembers.map(member => (
                    <li key={member.id}>{member.name}</li>
                ))}
            </ul>
        </div>
    );
};

export default TeamMembersList;
