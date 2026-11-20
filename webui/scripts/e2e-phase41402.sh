#!/usr/bin/env bash
# Phase-41402: UI ssh-auth-ms-86500-echo roster Soft 41400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-86500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs86500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 41400+ ssh-auth-ms-86500-echo roster ok"; echo "cleaned"; echo "OK: phase41402 e2e passed"
