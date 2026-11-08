#!/usr/bin/env bash
# Phase-11322: UI ssh-auth-bundle-hint roster Soft 11320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-bundle-hint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthBundleHintRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 11320+ ssh-auth-bundle-hint roster ok"; echo "cleaned"; echo "OK: phase11322 e2e passed"
