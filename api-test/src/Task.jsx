import React, { useState, useEffect } from 'react';
import { supabase } from './supabaseClient'; // Assuming you have a file named supabase.js exporting the initialized Supabase client

const Task = ({ session, teamID }) => {
    const [exercises, setExercises] = useState([]);
    const [newExerciseName, setNewExerciseName] = useState('');
    const [tasks, setTask] = useState([]);
    const [taskName, setTaskName] = useState('');
    const [taskDetails, setTaskDetails] = useState('');
    const [taskExercises, setTaskExercises] = useState([]);

    useEffect(() => {
        fetchExercises();
    }, [session, teamID]); // Fetch exercises whenever session or teamID changes

    const fetchExercises = async () => {
        try {
            const { data, error } = await supabase
                .from('exercises')
                .select('*')
                .eq('team_id', teamID);

            if (error) {
                throw error;
            }

            setExercises(data);
        } catch (error) {
            console.error('Error fetching exercises:', error.message);
        }
    };

    const createTask = async (event) => {
        event.preventDefault();
        console.log(taskExercises);
        const exerciseIDs = taskExercises.map(id => parseInt(id, 10));
        try {
            const { error } = await supabase.rpc('create_task', { details: { desc: taskDetails }, exercises: exerciseIDs, team_id: teamID, title: 'task1' })
            if (error) {
                throw error;
            }
        } catch (error) {
            console.log("error inserting task", error.message);
        }
    }

    const createExercise = async (event) => {
        event.preventDefault();
        try {
            const { error } = await supabase
                .from('exercises')
                .insert({ name: newExerciseName, team_id: teamID });

            if (error) {
                throw error;
            }

            // Clear input field after successful insertion
            setNewExerciseName('');

            // Fetch exercises again to update the displayed exercises
            fetchExercises();
        } catch (error) {
            console.error('Error creating exercise:', error.message);
        }
    };

    return (
        <div>
            <h2>Create Exercise</h2>
            <form onSubmit={createExercise}>
                <input
                    type="text"
                    value={newExerciseName}
                    onChange={(e) => setNewExerciseName(e.target.value)}
                    placeholder="Enter exercise name"
                    required
                />
                <button type="submit">Create</button>
            </form>
            <h2>Exercises</h2>
            <ul>
                {exercises.map(exercise => (
                    <li key={exercise.id}>Exercise ID: {exercise.id}, Name: {exercise.name}</li>
                ))}
            </ul>
            <h2>Create Task</h2>
            <form onSubmit={createTask}>
                <input
                    type="text"
                    value={taskDetails}
                    onChange={(e) => setTaskDetails(e.target.value)}
                    placeholder="Enter task details"
                    required
                />
                <h3>Exercise IDs</h3>
                {taskExercises.map((exerciseId, index) => (
                    <div key={index}>
                        <input
                            type="text"
                            value={exerciseId}
                            onChange={(e) => {
                                const updatedExercises = [...taskExercises];
                                updatedExercises[index] = e.target.value;
                                setTaskExercises(updatedExercises);
                            }}
                            placeholder="Enter exercise ID"
                            required
                        />
                    </div>
                ))}
                <button type="button" onClick={() => setTaskExercises([...taskExercises, ''])}>Add Exercise ID</button>
                <button type="submit">Create task</button>
            </form>
        </div>
    );
};

export default Task;
