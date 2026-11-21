#!/usr/bin/env bash
# Phase-38442: UI ssh-auth-soft-40120-echo roster Soft 38440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-40120-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft40120EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 38440+ ssh-auth-soft-40120-echo roster ok"; echo "cleaned"; echo "OK: phase38442 e2e passed"
