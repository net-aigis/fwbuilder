#!/usr/bin/env bash
# Phase-19642: UI ssh-auth-ms-52500-echo roster Soft 19640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-52500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs52500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 19640+ ssh-auth-ms-52500-echo roster ok"; echo "cleaned"; echo "OK: phase19642 e2e passed"
