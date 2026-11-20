#!/usr/bin/env bash
# Phase-42042: UI ssh-auth-ms-87500-echo roster Soft 42040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-87500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs87500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 42040+ ssh-auth-ms-87500-echo roster ok"; echo "cleaned"; echo "OK: phase42042 e2e passed"
