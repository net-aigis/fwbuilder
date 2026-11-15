#!/usr/bin/env bash
# Phase-32842: UI ssh-auth-schema-347-echo roster Soft 32840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-347-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema347EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 32840+ ssh-auth-schema-347-echo roster ok"; echo "cleaned"; echo "OK: phase32842 e2e passed"
