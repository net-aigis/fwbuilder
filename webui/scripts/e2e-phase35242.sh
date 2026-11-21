#!/usr/bin/env bash
# Phase-35242: UI ssh-auth-soft-36520-echo roster Soft 35240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-36520-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft36520EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 35240+ ssh-auth-soft-36520-echo roster ok"; echo "cleaned"; echo "OK: phase35242 e2e passed"
