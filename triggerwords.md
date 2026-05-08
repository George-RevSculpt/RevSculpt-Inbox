# RevSculpt Inbox — Signal Library
### Trigger word and phrase reference for `/revsculpt-inbox` · v1.2.0

Sources: HubSpot deliverability research, Google Postmaster guidelines, ActiveCampaign spam documentation, Mailmeteor trigger word database, Snov.io 550+ spam trigger words list, Puzzleinbox cold email spam trigger reference, Prospeo spam words checker database, internal RevSculpt outbound copy testing.

Severity tiers: **CRITICAL** (−10 pts) · **HIGH** (−7 pts) · **MEDIUM** (−4 pts)

---

## Layer 1 — Token Blacklist

All tokens below are flagged on exact match and as substrings inside compound or hyphenated forms. Plural and past-tense forms are automatically included. Case-insensitive. Context does not exempt a token.

### Financial Signals (CRITICAL)

access, accounts, affordable, annuity, approve, approved, assets, bank, bankruptcy, beneficiary, billion, billionaire, billing, bitcoin, bonus, borrow, btc, buyout, capital, card, cash, certified, charges, claim, clearance, collateral, commission, compensation, consolidate, cost, coupon, credit, crypto, cryptocurrency, cure, deal, debt, deposit, discount, dollars, earn, equity, expire, fee, finance, financial, foreclosure, free, fund, gift, giveaway, gold, guarantee, guaranteed, hidden, income, insurance, interest, invest, investment, invoice, jackpot, leverage, lifetime, loan, lottery, luxury, medical, million, money, mortgage, obligation, offer, offshore, opportunity, order, payment, payout, pennies, performance, premium, price, principal, prize, profit, promo, promotion, promise, purchase, raise, rate, rebate, redeem, refund, refinance, removal, rental, retainer, returns, reward, salary, savings, selected, solution, subscribe, subscription, timeshare, thousands, transaction, transfer, trial, undisclosed, unlimited, unsolicited, upfront, vip, wage, warranty, wholesale, winner, winning

### Pressure & Urgency Signals (HIGH)

act, action, amazing, arrange, apply, bulk, buy, call, cancel, cancellation, check, click, congratulations, deadline, delete, download, exceptional, exclusive, explosive, final, hurry, immediately, install, instant, jaw-dropping, junk, life-changing, limited, miracle, must, now, obligation, once, only, order, password, phenomenal, pitch, pre-approved, promise, remarkable, rush, sample, score, spam, spectacular, terms, today, traffic, tremendous, unbelievable, urgent, vacation, verify, warning, wonderful

### Health & Pharma Signals (HIGH)

acne, cholesterol, cure, diagnostic, drug, erectile, health, herbal, medicine, medication, miracle, natural, pharmacy, pill, prescription, remedy, supplement, testosterone, treatment, valium, vicodin, weight, wellness, xanax

### Adult & Blacklisted Signals (CRITICAL)

adult, betting, blackjack, casino, dating, gambling, hookup, lottery, nude, obscene, poker, porn, sex, sexy, singles, slots

### Security & Phishing Signals (CRITICAL)

credentials, identity, login, password, phishing, security, username, verify

### Medium-Risk Tokens (MEDIUM)

ad, additional, all, apply, best, business, click, contact, customer, easy, enter, fill, form, get, go, great, growth, guarantee, help, hot, information, just, learn, link, look, make, marketing, meet, more, most, name, new, no, not, off, once, one, open, only, out, over, own, pay, percent, please, potential, power, prove, ready, reply, results, sale, search, select, send, sign, solution, start, stop, supply, system, take, top, unique, up, use, value, view, when, win, won, work, worth

---

## Layer 1 — Compound Token Rules

A banned token embedded inside a compound or hyphenated word is still flagged. The compound form does not make it safe.

| Compound form | Banned token triggered |
|---|---|
| risk-free | risk |
| money-back | money |
| cash-out | cash |
| cash-cycle | cash |
| lower-cost | cost |
| low-cost | cost |
| no-cost | cost |
| cost-free | cost |
| cost-effective | cost |
| interest-free | interest |
| pre-approved | approved |
| debt-free | debt |
| fee-free | fee |
| earn-more | earn |
| high-yield | yield |
| high-return | return |
| sale-leaseback | sale |
| invoice-line | invoice |
| click-here | click |
| sign-up | sign |
| act-now | act |
| buy-now | buy |

---

## Layer 2 — Phrase Patterns

### Stale Follow-Up Patterns (HIGH · −7 pts each)

These phrases signal a lazy re-touch with no new value. Spam engines recognize and filter them aggressively.

- just following up once
- following up here
- bumping this once
- bumping this up
- looping back
- circling back
- circle back
- just checking in
- touching base
- reaching out again
- per my last email
- as I mentioned
- as previously discussed
- did you see my last email
- following up on my previous
- wanted to reconnect
- wanted to follow up
- hope this finds you well
- hope all is well
- last note from me here
- one more quick follow-up
- keep this open
- compare notes live
- appreciate the reply
- looping you in
- off chance
- all good
- great fit

### Seller-Centric Openers (MEDIUM · −4 pts each)

Opening lines that lead with the sender's identity or a generic reference instead of the buyer's specific situation. Lower reply rates and signal low-effort targeting.

- I came across your profile
- I help companies like yours
- I wanted to reach out
- I noticed you
- I saw that you
- quick question for you
- I hope this email finds you
- I know you're busy
- I'll be brief
- just wanted to drop a quick note
- reaching out because
- my name is [name] and I
- I was browsing your website
- I work with companies in [industry]
- would you be open to a call

---

## Layer 3 — Risk Cluster Library

### Cluster 1: Financial Hype (CRITICAL)

$$$, €€€, £££, 50% off, affordable deal, avoid bankruptcy, bad credit, big bucks, cash bonus, cash out, cents on the dollar, claim your discount, consolidate debt, double your cash, double your income, double your money, double your wealth, earn cash, earn extra cash, earn extra income, earn money, easy income, easy terms, eliminate bad credit, expect to earn, fast cash, financial freedom, for free, for just $, free access, free consultation, free gift, free hosting, free info, free investment, free membership, free money, free preview, free quote, free trial, full refund, get out of debt, get paid, giveaway, guaranteed deposit, increase revenue, increase sales, instant earnings, instant income, investment advice, join millions, lower rates, lowest price, make money, million dollars, money back, money-back guarantee, mortgage rates, once in a lifetime, only $, pennies a day, potential earnings, price protection, pure profit, risk-free, save big money, save $, save up to, satisfaction guaranteed, special promotion, subject to credit, why pay more, your income

### Cluster 2: Scammy / Too-Good-To-Be-True (CRITICAL)

100% guaranteed, access now, act fast, amazing deal, apply now, as seen on, be your own boss, best deal, big profit, business opportunity, can't miss, click below, click here, dear beneficiary, dear friend, dear madam, dear sir, dear valued customer, deal ending soon, don't delete, exclusive deal, fantastic offer, get it now, good day, great news, guaranteed results, hello dear, important information, incredible deal, instant savings, limited time, lower rates, must read, my dear friend, no catch, no cost, no credit check, no fees, no gimmick, no hidden costs, no hidden fees, no interest, no investment, no obligation, no purchase necessary, no questions asked, no strings attached, not a scam, not junk, once in a lifetime, only available here, order now, potential earnings, pure profit, requires initial investment, risk-free, special invitation, special offer, this isn't a scam, this isn't junk, this isn't spam, this won't last, to whom it may concern, undisclosed, unsecured credit, unsecured debt, we hate spam, will not believe

### Cluster 3: Marketing Overpromises (HIGH)

10x your results, 10x revenue, 3x your, 5x your, achieve results overnight, all-natural, best in class, best on the market, breakthrough, can't lose, change your life, completely free, double your, dramatically increase, effortlessly, eliminate, exceptional results, explode your, extraordinary, fastest growing, guaranteed to, industry leading, incredible results, instantly, life-changing, most powerful, never before seen, no experience needed, number one, overnight results, proven formula, proven system, proven results, quick fix, real results, remarkable, results guaranteed, revolutionary, see results immediately, skyrocket, solution to all, transform your, ultimate, unbeatable, unrivaled, world class

### Cluster 4: Urgency & Clickbait Pressure (HIGH)

act immediately, act now, act today, before it's too late, buy now, call now, click here now, click now, deadline, do it today, don't delay, don't miss out, don't wait, ends soon, expiring soon, final notice, for a limited time, get it now, get started now, hurry, hurry up, immediately, last chance, last day, limited availability, limited offer, limited spots, limited time offer, now or never, offer expires, only X left, order now, response required, rush, supplies are limited, take action now, time is running out, time sensitive, today only, urgent, while supplies last

### Cluster 5: Health & Pharma Claims (HIGH)

all natural, amazing cure, anti-aging, be amazed, body fat, burn fat, collagen, detox, dramatic weight loss, fast weight loss, feel great, gain muscle, heal, increase libido, lose weight, low calorie, medical research, medication, naturally, obesity, pain free, proven weight loss, remedy, removes fat, sleep, stop aging, thin, weight loss

### Cluster 6: Phishing & Security Language (CRITICAL)

account update, change your password, confirm your account, confirm your details, confirm your email, dear account holder, dear valued customer, download now, final notice, identity, install now, last warning, log in now, password, password reset, PIN, security alert, security breach, security update, sign and return, unauthorized, update account, update your information, verify account, verify email, verify identity, warning message, your account, your details

### Cluster 7: Gambling & Adult Content (CRITICAL)

adult content, all adult, bet now, blackjack, casino, casino bonus, click to win, compete for your business, dating service, free chips, free spins, gamble, gambling, genitalia, girl, girls, hookup, instant winnings, jackpot, live dealer, lottery, lottery winner, lucky, lucky chance, mailer, mass email, mass marketing, meet singles, meet women, multi-level marketing, nude, online betting, online casino, online gaming, poker, poker tournament, porn, sex, sexy, singles, slots, slots jackpot, spin to win, work from home, winning numbers, xxx

### Cluster 8: Unverified ROI Claims — RevSculpt Exclusive (HIGH)

guaranteed meetings, guaranteed pipeline, guaranteed results, guaranteed revenue, guaranteed ROI, 100% success rate, proven to book, clients see results, drives qualified meetings, fills your calendar, meetings on autopilot, pipeline on demand, revenue on autopilot, unlimited leads, never run out of leads, endless pipeline, infinite leads, autopilot revenue, passive income from B2B, we guarantee meetings, book meetings guaranteed

---

## Layer 4 — Format Rules

All thirteen violations are binary — present or not. No context exceptions.

1. **ALL CAPS** — three or more consecutive capital letters outside a known acronym
2. **Stacked punctuation** — more than one exclamation mark in the full copy
3. **Decorative dashes** — em dash (—) used ornamentally rather than grammatically
4. **Link density** — more than one hyperlink in a cold email body
5. **Fake-thread subject** — "Re:" or "Fwd:" in a subject that is not a real reply
6. **Orphaned tokens** — unfilled placeholders left in copy: `{{first_name}}`, `[Name]`, `{company}`, `[[variable]]`
7. **Blank line stacking** — three or more consecutive empty lines
8. **Symbol decoration** — promotional glyphs: ★ ✓ ► ✦ ⚡ used for visual effect
9. **Leading emoji in subject** — subject line that opens with an emoji character (spammers adopted this; filters now treat it as a signal)
10. **Subject starts with numeral** — subject line that begins with a digit ("5 reasons…", "10 ways…")
11. **Ellipsis in subject** — subject line containing "…" or "..." (creates artificial suspense; flagged as clickbait)
12. **URL shortener link** — any link using bit.ly, tinyurl, goo.gl, ow.ly, or similar redirect services (phishing signal)
13. **Domain mismatch** — visible link anchor text references a different domain than the actual destination URL

---

## Layer 5 — Buyer Signal Checks

Six checks. Each failure deducts from ICP Clarity Score only. Definitions are in `revsculpt-inbox.md` (B1–B6).

| Check | What passes | What fails |
|---|---|---|
| B1 Named Pain | Specific, recognizable problem named | Vague benefit claims |
| B2 Grounded Proof | Number, named outcome, or verifiable reference | Unsubstantiated assertions |
| B3 Single Action | One clear CTA | Multiple asks or vague closes |
| B4 Buyer-Specific Reference | Something specific about this recipient | "companies like yours" |
| B5 Buyer-First Opener | Buyer's situation or observation first | Sender name/company/service first |
| B6 Length Discipline | 125 words or under | Over 125 words |

---

## Plain Language Map

These are rewrite directions — not word swaps. Always rewrite the full line from the idea underneath.

| Flagged phrasing | Rewrite direction |
|---|---|
| "guaranteed results" | State the mechanism, not the outcome promise |
| "free trial" | "you can try it" or "no commitment to start" |
| "risk-free" | Remove entirely — or "you can stop anytime" |
| "limited time offer" | Remove urgency framing entirely |
| "I help companies like yours" | Name the specific company and the specific observable thing |
| "just following up" | State a new reason to reply — or don't send |
| "let me know if you're interested" | Ask one clear, specific question |
| "guaranteed meetings" | Cite a real outcome from a named engagement type |
| "10x your pipeline" | Cite the actual number from a real example |
| "hope this finds you well" | Cut entirely — start with the relevant observation |
| "increase revenue" | Name the specific business outcome in plain terms |
| "financial freedom" | Name the actual outcome: reduce overhead, clear the line, exit the position |
| "no cost to you / free / no fee" | "the fee sits on the other side — nothing comes out of your budget" |
| "click here" | "let me know and I can send it over" |
| "urgent / act now" | Remove entirely — rewrite without any pressure angle |

---

## Usage Notes

- Context does not exempt a token. "We don't do free trials" still contains "free" — flag it.
- Plural forms are included automatically. "loans" flags on "loan". "guarantees" flags on "guarantee".
- A banned token inside a company name should be removed or the name compressed (see Company Name Rule in `revsculpt-inbox.md`).
- LinkedIn DM mode applies tighter standards: 75-word maximum, no links permitted.
- When uncertain about a word not on this list: if it sounds like a coupon, a pitch, a scam, or a pressure tactic — flag and rewrite.
