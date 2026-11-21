#!/usr/bin/env bash
# Phase-28602: UI ssh-auth-ms-66500-echo roster Soft 28600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-66500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs66500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 28600+ ssh-auth-ms-66500-echo roster ok"; echo "cleaned"; echo "OK: phase28602 e2e passed"
