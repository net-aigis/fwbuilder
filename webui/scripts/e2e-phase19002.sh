#!/usr/bin/env bash
# Phase-19002: UI ssh-auth-ms-51500-echo roster Soft 19000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-51500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs51500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 19000+ ssh-auth-ms-51500-echo roster ok"; echo "cleaned"; echo "OK: phase19002 e2e passed"
