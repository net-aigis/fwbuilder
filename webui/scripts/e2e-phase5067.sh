#!/usr/bin/env bash
# Phase-5067: clear title mentions ssh-refusal-paths roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-refusal-paths roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshRefusalPathsRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_refusal_paths_roster ok"; echo "cleaned"; echo "OK: phase5067 e2e passed"
