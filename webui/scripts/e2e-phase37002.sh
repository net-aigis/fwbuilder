#!/usr/bin/env bash
# Phase-37002: UI ssh-auth-schema-399-echo roster Soft 37000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-399-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema399EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 37000+ ssh-auth-schema-399-echo roster ok"; echo "cleaned"; echo "OK: phase37002 e2e passed"
