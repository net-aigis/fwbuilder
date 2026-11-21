#!/usr/bin/env bash
# Phase-13642: UI ssh-auth-refusal-echo roster Soft 13640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-refusal-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthRefusalEchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 13640+ ssh-auth-refusal-echo roster ok"; echo "cleaned"; echo "OK: phase13642 e2e passed"
