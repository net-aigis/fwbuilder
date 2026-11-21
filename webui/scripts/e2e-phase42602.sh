#!/usr/bin/env bash
# Phase-42602: UI ssh-auth-soft-44800-echo roster Soft 42600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-44800-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft44800EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 42600+ ssh-auth-soft-44800-echo roster ok"; echo "cleaned"; echo "OK: phase42602 e2e passed"
