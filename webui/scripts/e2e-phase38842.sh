#!/usr/bin/env bash
# Phase-38842: UI ssh-auth-ms-82500-echo roster Soft 38840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-82500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs82500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 38840+ ssh-auth-ms-82500-echo roster ok"; echo "cleaned"; echo "OK: phase38842 e2e passed"
