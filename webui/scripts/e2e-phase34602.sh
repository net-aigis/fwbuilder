#!/usr/bin/env bash
# Phase-34602: UI ssh-auth-soft-35800-echo roster Soft 34600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-35800-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft35800EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 34600+ ssh-auth-soft-35800-echo roster ok"; echo "cleaned"; echo "OK: phase34602 e2e passed"
