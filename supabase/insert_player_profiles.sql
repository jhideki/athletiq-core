DO $$
BEGIN
    -- Loop through each record in the players table
    FOR player_record IN SELECT * FROM public.players
    LOOP
        -- Insert into profiles if not exists
        INSERT INTO public.profiles (person_id, user_type, city, country, first_name, last_name, state)
        VALUES (
            player_record.user_id,
            'player', -- user_type placeholder (can be set to appropriate value)
            'Canada', -- city placeholder (can be set to appropriate value)
            'Vancouver', -- country placeholder (can be set to appropriate value)
            'Ben', -- first_name placeholder (can be set to appropriate value)
            'Smith, -- last_name placeholder (can be set to appropriate value)
            NULL  -- state placeholder (can be set to appropriate value)
        )
        ON CONFLICT (person_id) DO NOTHING;

        -- Insert into player_profiles table
        INSERT INTO public.player_profiles (player_id, profile_id)
        SELECT
            player_record.id,
            profile_record.id
        FROM
            public.profiles profile_record
        WHERE
            profile_record.person_id = player_record.user_id
        ON CONFLICT DO NOTHING; -- Avoid duplicate entries in player_profiles
    END LOOP;
END $$;
