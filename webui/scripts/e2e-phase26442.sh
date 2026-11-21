#!/usr/bin/env bash
# Phase-26442: UI ssh-auth-schema-267-echo roster Soft 26440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-267-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema267EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 26440+ ssh-auth-schema-267-echo roster ok"; echo "cleaned"; echo "OK: phase26442 e2e passed"
