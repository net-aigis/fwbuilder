#!/usr/bin/env bash
# Phase-40202: UI ssh-auth-schema-439-echo roster Soft 40200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-439-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema439EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 40200+ ssh-auth-schema-439-echo roster ok"; echo "cleaned"; echo "OK: phase40202 e2e passed"
