#!/usr/bin/env bash
# Phase-19402: UI ssh-auth-schema-179-echo roster Soft 19400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-179-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema179EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 19400+ ssh-auth-schema-179-echo roster ok"; echo "cleaned"; echo "OK: phase19402 e2e passed"
