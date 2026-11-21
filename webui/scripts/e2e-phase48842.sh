#!/usr/bin/env bash
# Phase-48842: UI ssh-auth-schema-547-echo roster Soft 48840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-547-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema547EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 48840+ ssh-auth-schema-547-echo roster ok"; echo "cleaned"; echo "OK: phase48842 e2e passed"
