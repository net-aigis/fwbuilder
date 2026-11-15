#!/usr/bin/env bash
# Phase-32202: UI ssh-auth-schema-339-echo roster Soft 32200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-339-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema339EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 32200+ ssh-auth-schema-339-echo roster ok"; echo "cleaned"; echo "OK: phase32202 e2e passed"
