# RevSculpt Inbox — Cold Email Spam Checker & Deliverability Scanner

[![License](https://img.shields.io/badge/license-Proprietary-black?style=flat-square)](./LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-skill-orange?style=flat-square)](https://claude.ai/code)
[![Built by RevSculpt](https://img.shields.io/badge/by-RevSculpt-0a0a0a?style=flat-square)](https://revsculpt.com)

*Built by [RevSculpt](https://revsculpt.com) — the B2B revenue systems team behind 6,000+ qualified meetings booked.*

---

Your cold email passed the spam checker. It still got no reply.

That's because most spam checkers only ask one question: will this reach the inbox? RevSculpt Inbox asks two. The second one — *will a real buyer respond to this?* — is the question nobody else checks.

Paste your cold email copy. Get two scores, every violation listed by severity, and a fully rewritten version that clears both before it reaches you.

**RevSculpt Inbox is a cold email spam checker and deliverability scanner built as a [Claude Code](https://claude.ai/code) skill.** No dashboard. No account. No browser tab. It runs inside Claude Code wherever you already work.

---

## Why Two Scores Instead of One

Every cold email has two ways to fail.

**It fails to reach the inbox** — spam filters catch the words, the formatting, or the sending patterns and route it to junk before the buyer ever sees it.

**It fails to get a reply** — it reaches the inbox but reads like a mass blast. Vague opener, no specific proof, generic CTA. The buyer sees it, skims it, deletes it.

Standard spam checkers only catch the first failure. RevSculpt Inbox catches both.

| | RevSculpt Inbox | Standard spam checker |
|---|---|---|
| Spam word detection | ✅ 400+ words, severity-weighted | ✅ basic word list |
| Formatting checks | ✅ 13 checks | ✅ a few |
| Buyer signal check | ✅ 6 ICP checks | ✗ |
| Unverified ROI claim detection | ✅ | ✗ |
| Seller-centric opener detection | ✅ | ✗ |
| Severity weighting (CRITICAL / HIGH / MEDIUM) | ✅ | ✗ |
| Sequence mode with cross-step analysis | ✅ | ✗ |
| Accuracy check before rewriting | ✅ | ✗ |
| Dual-score gate — both must pass | ✅ | ✗ |

---

## What a Scan Looks Like

Paste your email. This is what comes back:

```
▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
REVSCULPT INBOX SCAN
Subject: Quick question about your outbound
▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔

Deliverability Score:  54/100 — ❌ HIGH DELIVERABILITY RISK
ICP Clarity Score:     40/100 — 🚫 DO NOT SEND
Total violations:      9 (2 CRITICAL · 3 HIGH · 2 MEDIUM · 2 format)

▸ Layer 1 — Token Blacklist ──────────────────────
[L1 · TOKEN] "guarantee" → CRITICAL · −10 pts
  → rewrite: remove the guarantee claim — name the mechanism instead

[L1 · TOKEN] "free" → HIGH · −7 pts
  → rewrite: "no commitment to start" or remove entirely

▸ Layer 2 — Phrase Patterns ──────────────────────
[L2 · PATTERN] "just following up once" → Stale Follow-Up · −7 pts
  → rewrite: state a new reason to reply — or don't send

▸ Layer 3 — Risk Clusters ────────────────────────
[L3 · CLUSTER] "guaranteed meetings" → Cluster 8: Unverified ROI · −8 pts
  → rewrite: cite a real outcome from a real engagement

▸ Layer 4 — Format Audit ─────────────────────────
[L4 · FORMAT] Orphaned token: {{first_name}} · −5 pts
  → fix: fill or remove before sending

▸ Layer 5 — Buyer Signal Check ───────────────────
[L5 · BUYER] B1 Named Pain: FAILED · −15 pts
  → fix: name a specific problem this buyer actually faces

[L5 · BUYER] B5 Buyer-First Opener: FAILED · −15 pts
  → fix: open with their situation — not your pitch

▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
REWRITTEN COPY
Gate cleared in 2 pass(es) · zero violations confirmed
▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔

[Full rewrite — deliverability clean, buyer-signal confirmed, ready to send]

▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
VERDICT
▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔

Send-ready — Deliverability 94/100 · ICP Clarity 85/100.
```

---

## How Scoring Works

**Deliverability Score** tracks spam compliance. Starts at 100, deducted per violation:

```
CRITICAL token    −10 pts   (Layer 1 — words like "guarantee", "free", "urgent")
HIGH token         −7 pts   (Layer 1 — words like "discount", "click", "amazing")
MEDIUM token       −4 pts   (Layer 1 — words like "best", "results", "solution")
Phrase pattern     −7 pts   (Layer 2 — "just checking in", "I help companies like yours")
Risk cluster       −8 pts   (Layer 3 — financial hype, scam framing, fake urgency)
Format violation   −5 pts   (Layer 4 — ALL CAPS, URL shorteners, fake Re: threads)
```

**ICP Clarity Score** tracks buyer specificity. Starts at 100, deducted per failed check:

```
Each failed buyer signal check  −15 pts  (Layer 5 — named pain, proof, CTA, opener...)
```

| Score | What it means |
|---|---|
| 90–100 | ✅ Send-ready |
| 75–89  | ⚠️ Revise before sending |
| 50–74  | ❌ High deliverability risk |
| 0–49   | 🚫 Do not send |

Both scores must clear their threshold in the same gate pass. A clean deliverability score paired with a low ICP score is still a hold.

---

## The Six Layers

```
SIX LAYERS. TWO SCORES. ONE GATE.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

── SCORE 1: Will it reach the inbox? ────────────────

  Words       400+ banned words checked one by one.
              Not just flagged — weighted by how bad they are.
              CRITICAL words cost more than HIGH, which cost more than MEDIUM.
              Plurals, past tense, and hyphenated forms all count.
              ("risk-free" still flags. "guaranteed" still flags.)

  Phrases     35+ patterns that get emails filtered or ignored.
              Stale follow-ups: "just checking in", "circling back", "hope this finds you well"
              Lazy openers: "I help companies like yours", "I wanted to reach out"

  Clusters    8 categories of high-risk language — financial promises,
              scammy framing, fake urgency, health claims, phishing phrases,
              gambling terms, and unverified ROI claims like "guaranteed meetings".

  Formatting  13 things spam filters flag beyond the words themselves.
              ALL CAPS. Fake "Re:" subjects. Unfilled {{variables}}.
              URL shorteners. Exclamation stacking. Leading emoji. And more.

── SCORE 2: Will a real buyer respond? ──────────────

  Six checks that no other spam checker runs.

  → Does it name a real problem the buyer actually has?
  → Is there a real proof point — a number, a name, a result?
  → Is there one clear ask — not two, not vague?
  → Does it reference something specific about this person?
  → Does it open with their situation — not your pitch?
  → Is it under 125 words?

── THE GATE ─────────────────────────────────────────

  After every rewrite, both scores are recalculated.
  Score 1 must hit 90. Score 2 must hit 75.
  If either falls short, it rewrites and checks again.
  You only see the version that passes both.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Works on: emails · subject lines · follow-up sequences
          CTAs · LinkedIn DMs · any cold outreach copy
```

---

## How the Rewrite Works

Before touching a single word, it checks any claim in your copy that could change meaning when reworded — timelines, fees, outcomes, promises. If a line is ambiguous, it asks you to clarify. It never guesses and never changes what you actually meant.

Then it rewrites. Not word swaps — full line rewrites from the idea underneath:

```
  Promotional language  →  observational language
  Pressure              →  permission
  Hype                  →  specificity
  Vague benefit claims  →  named problems
  Sender-first openers  →  buyer-first openers
  Complex words         →  plain words
```

Every rewrite is checked against all six layers before it reaches you. If anything fails, it rewrites again.

---

## Good to Know

**Starting a scan**

Type `/revsculpt-inbox` and paste your copy. That's it.

If you'd rather just ask — that works too. Say *"check this for spam"* or *"will this land in inbox"* anywhere in Claude Code and the scan starts automatically. No slash command needed.

**What you can paste**

A full email, just the subject line, a LinkedIn DM, a follow-up sequence, a single sentence you're unsure about. Paste whatever you have — the scan adapts to what it receives.

Running a sequence? Label each step (Step 1, Step 2...) and paste them together. It scans each one individually, then checks if the sequence as a whole adds value at each step or just repeats itself.

**Leave your variables in**

`{{first_name}}`, `{company}`, `[Name]` — leave them as-is. Unfilled ones get flagged. Filled ones are treated as normal text.

**When it asks you a question**

This happens when a claim in your copy could mean two different things when reworded. Answer it and the rewrite stays accurate. It never assumes.

**When the rewrite still isn't right**

Tell it exactly what's off. *"The opener is too bland"* or *"the CTA sounds pushy"* — it runs another pass until both scores clear.

---

## Frequently Asked Questions

**What is RevSculpt Inbox?**
RevSculpt Inbox is a cold email spam checker and deliverability scanner built as a Claude Code skill. It scans cold email copy against 400+ spam trigger words, 8 risk clusters, and 13 formatting rules — then checks whether the email is targeted enough to get a reply from a real buyer. It rewrites everything until both a deliverability score and a buyer clarity score pass.

**How is this different from other spam checkers?**
Most cold email spam checkers flag banned words and give you a score. RevSculpt Inbox also checks whether the email is written for a specific buyer or reads like a mass blast — something no standard spam word checker does. It also weights violations by severity, detects unverified ROI claims, and only delivers a rewrite when both scores clear in the same pass.

**What spam trigger words does it check?**
RevSculpt Inbox checks 400+ spam trigger words sourced from Snov.io, Mailmeteor, Prospeo, Puzzleinbox, ActiveCampaign, and internal RevSculpt outbound testing. Words are weighted: CRITICAL (−10 pts), HIGH (−7 pts), MEDIUM (−4 pts). Plurals, past tense forms, and hyphenated compounds are all caught — "guaranteed" flags on "guarantee", "risk-free" flags on "risk".

**Does it work for LinkedIn DMs?**
Yes. Say "LinkedIn" or "DM" when pasting your copy. It applies a 75-word limit, blocks all links, and runs all six layers against the tighter format.

**Does it work for email sequences?**
Yes. Label each step (Step 1, Step 2...) and paste the full sequence. It scans each email individually, then runs a cross-step check to flag repeated phrases, steps that add no new value, and sequences that escalate pressure instead of building it.

**What does the ICP Clarity Score measure?**
The ICP Clarity Score measures whether the email is written for a specific buyer with a specific problem, or whether it reads like a generic blast. Six checks: named pain, grounded proof, single CTA, buyer-specific reference, buyer-first opener, and length under 125 words. Each failure deducts 15 points.

**What score do I need to send?**
Deliverability Score of 90 or above, and ICP Clarity Score of 75 or above — both in the same scan pass. One clearing while the other fails is not a send-ready result.

**Will it change what my email means?**
No. Before rewriting any line with a specific claim — a number, a timeline, a fee structure — it asks you to confirm what you meant. It rewrites for clarity and deliverability, not to change your message.

---

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/George-RevSculpt/RevSculpt-Inbox/main/install.sh | bash
```

Open [Claude Code](https://claude.ai/code) in any directory and run:

```
/revsculpt-inbox
```

Paste your copy. Get a clean scan.

Already installed? Re-run the same command to update to the latest version.

---

## Files

| File | Purpose |
|---|---|
| `revsculpt-inbox.md` | The Claude Code skill — installs to `~/.claude/skills/` |
| `triggerwords.md` | Signal library — 400+ tokens, 8 clusters, 13 format rules |
| `revsculpt-inbox-active.sh` | Hook script — fires on relevant prompts |
| `.claude/settings.json` | Hook configuration — smart regex matcher |
| `install.sh` | One-command installer |

---

## Requirements

- [Claude Code](https://claude.ai/code) — the CLI for Claude
- An [Anthropic](https://anthropic.com) account
- macOS, Linux, or Windows (WSL)
- `curl` or `wget`

---

**Built by**

[**RevSculpt**](https://revsculpt.com) — B2B Revenue Systems · Signal-Timed Outreach · AI-Powered Enrichment · Full Pipeline Infrastructure

*18 days to first qualified meeting. 6,000+ qualified meetings booked. 14x ROI on outbound spend.*

*Written and maintained by [RevSculpt](https://github.com/George-RevSculpt)*

© 2026 RevSculpt. All rights reserved. — [License](./LICENSE)

---

v1.2.0
