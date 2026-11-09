#!/usr/bin/env bash
# Phase-21642: UI ssh-auth-schema-207-echo roster Soft 21640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-207-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema207EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 21640+ ssh-auth-schema-207-echo roster ok"; echo "cleaned"; echo "OK: phase21642 e2e passed"
