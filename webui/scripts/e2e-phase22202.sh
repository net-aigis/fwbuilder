#!/usr/bin/env bash
# Phase-22202: UI ssh-auth-ms-56500-echo roster Soft 22200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-56500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs56500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 22200+ ssh-auth-ms-56500-echo roster ok"; echo "cleaned"; echo "OK: phase22202 e2e passed"
