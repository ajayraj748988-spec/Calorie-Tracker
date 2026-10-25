# FormTrack

Calorie tracker and workout planner in one file (`formtrack.html`). It works in two modes:

- **Local mode (default):** no setup. Data is saved in the browser on that device.
- **Cloud mode (Supabase):** email + password accounts, and your profile, food logs and workout ticks follow you across devices.

## Run locally
Open `formtrack.html` in a browser.

## Publish on GitHub Pages
1. Rename `formtrack.html` to `index.html` and push it to your repo.
2. Repo **Settings > Pages**: deploy from the `main` branch, root folder.
3. Your site will be at `https://<username>.github.io/<repo>/`.

## Turn on cloud accounts (Supabase, free tier)
1. Create a project at https://supabase.com.
2. **SQL Editor**: paste and run `supabase-setup.sql`. This creates the `ft_data` table with row-level security, so each user can only read and write their own data.
3. **Project Settings > API**: copy the **Project URL** and the **anon / publishable key**.
4. In `index.html`, fill in the two lines near the top of the script:
   ```js
   const SUPABASE_URL="https://xxxx.supabase.co";
   const SUPABASE_KEY="your-anon-key";
   ```
   The anon key is safe to publish because the row-level security rules protect the data. Never put the `service_role` key in this file.
5. **Authentication > URL Configuration**: set **Site URL** to your GitHub Pages address.
6. Optional: **Authentication > Providers > Email**: turn off "Confirm email" while testing. Otherwise new users must click the email link before signing in.
7. Commit and push. The login screen now asks for email and password.
