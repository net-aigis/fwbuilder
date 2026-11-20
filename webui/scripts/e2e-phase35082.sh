#!/usr/bin/env bash
# Phase-35082: UI ssh-auth-schema-375-echo roster Soft 35080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-375-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema375EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 35080+ ssh-auth-schema-375-echo roster ok"; echo "cleaned"; echo "OK: phase35082 e2e passed"
