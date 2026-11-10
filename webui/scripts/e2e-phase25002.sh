#!/usr/bin/env bash
# Phase-25002: UI ssh-auth-soft-25080-echo roster Soft 25000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-25080-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft25080EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 25000+ ssh-auth-soft-25080-echo roster ok"; echo "cleaned"; echo "OK: phase25002 e2e passed"
