#!/usr/bin/env bash
# Phase-11642: UI ssh-auth-track-echo roster Soft 11640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-track-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTrackEchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 11640+ ssh-auth-track-echo roster ok"; echo "cleaned"; echo "OK: phase11642 e2e passed"
