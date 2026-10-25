-- Run this once in Supabase: SQL Editor > New query > paste > Run
create table if not exists public.ft_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  json jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.ft_data enable row level security;

-- Each person can only touch their own row
create policy "read own row" on public.ft_data
  for select using (auth.uid() = user_id);
create policy "insert own row" on public.ft_data
  for insert with check (auth.uid() = user_id);
create policy "update own row" on public.ft_data
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "delete own row" on public.ft_data
  for delete using (auth.uid() = user_id);
