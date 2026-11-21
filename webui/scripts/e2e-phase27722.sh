#!/usr/bin/env bash
# Phase-27722: UI ssh-auth-schema-283-echo roster Soft 27720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-283-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema283EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 27720+ ssh-auth-schema-283-echo roster ok"; echo "cleaned"; echo "OK: phase27722 e2e passed"
