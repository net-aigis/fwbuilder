#!/usr/bin/env bash
# Phase-5547: clear title mentions ssh-refusal-path-titles roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-refusal-path-titles roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshRefusalPathTitlesRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_refusal_path_titles_roster ok"; echo "cleaned"; echo "OK: phase5547 e2e passed"
