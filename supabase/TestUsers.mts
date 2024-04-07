import { createSeedClient } from '@snaplet/seed';
import { createClient } from "@supabase/supabase-js";


// You can use @snaplet/copycat to generate fake data for a field, for example:
// ```
// await seed.users([{ email: ({ seed }) => copycat.email(seed) }])
// ```
// More on this in our docs: https://docs.snaplet.dev/core-concepts/seed#inside-the-snapletseed-workflow
import { copycat } from '@snaplet/copycat'

// This is a basic example generated by Snaplet to start you off, check out the docs for where to go from here
// * For more on getting started with @snaplet/seed: https://docs.snaplet.dev/getting-started/quick-start/seed
// * For a more detailed reference: https://docs.snaplet.dev/core-concepts/seed


const seed = await createSeedClient({
    dryRun: process.env.DRY !== '0',
});

const teamID = 120934405987
const supabase = createClient(
    "http://127.0.0.1:54321",
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImV4cCI6MTk4MzgxMjk5Nn0.EGIM96RAZx35lJzdJsyH-qQwv8Hdp7fsn3W0YpN81IU",
);

await seed.$resetDatabase()
async function registerCoach() {
    const { data, error } = await supabase.auth.signUp({
        email: 'testcoach@email.com',
        password: 'test1234',
    })
    await seed.persons([{
        id: data.user?.id,
        userType: 'coach',
    }])

    await seed.teams([{
        coachId: data.user?.id,
        id: teamID,
    }])
    await supabase.auth.signOut()
}

async function registerPlayer() {
    const { data, error } = await supabase.auth.signUp({
        email: 'testPlayer@email.com',
        password: 'test1234',
    })
    await seed.persons([{
        id: data.user?.id,
        userType: 'player',
    }])
    await seed.players([{
        teamId: teamID,
        userId: data.user?.id,
    }])

    //add more dummy players
    await seed.players((x) => x(10, {
        teamId: teamID,
    }
    ))

    await supabase.auth.signOut()
}
async function registerUser() {
    const { data, error } = await supabase.auth.signUp({
        email: 'testuser@email.com',
        password: 'test1234',
    })

    await seed.persons([{
        id: data.user?.id,
        userType: null,
    }])

    await supabase.auth.signOut()
}

//generate test users
await registerCoach();
await registerPlayer();
await registerUser();
// Run it with: DRY=0 npx tsx seed.mts
