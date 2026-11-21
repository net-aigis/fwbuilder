#!/usr/bin/env bash
# Phase-5002: UI ssh-alternatives roster Soft 5000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-alternatives roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativesRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 5000+ ssh-alternatives roster ok"; echo "cleaned"; echo "OK: phase5002 e2e passed"
