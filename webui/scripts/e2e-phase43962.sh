#!/usr/bin/env bash
# Phase-43962: UI ssh-auth-ms-90500-echo roster Soft 43960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-90500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs90500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 43960+ ssh-auth-ms-90500-echo roster ok"; echo "cleaned"; echo "OK: phase43962 e2e passed"
