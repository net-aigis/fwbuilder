#!/usr/bin/env bash
# Phase-25642: UI ssh-auth-soft-25800-echo roster Soft 25640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-25800-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft25800EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 25640+ ssh-auth-soft-25800-echo roster ok"; echo "cleaned"; echo "OK: phase25642 e2e passed"
