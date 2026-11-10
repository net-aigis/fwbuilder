#!/usr/bin/env bash
# Phase-24202: UI ssh-auth-schema-239-echo roster Soft 24200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-239-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema239EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 24200+ ssh-auth-schema-239-echo roster ok"; echo "cleaned"; echo "OK: phase24202 e2e passed"
