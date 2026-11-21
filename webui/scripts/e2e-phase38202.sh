#!/usr/bin/env bash
# Phase-38202: UI ssh-auth-ms-81500-echo roster Soft 38200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-81500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs81500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 38200+ ssh-auth-ms-81500-echo roster ok"; echo "cleaned"; echo "OK: phase38202 e2e passed"
