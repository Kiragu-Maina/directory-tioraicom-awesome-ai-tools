# Security policy

This repository contains no application code. It is a Markdown list of links to third-party
websites, so the realistic risk is a **listed link becoming dangerous** rather than a
vulnerability in anything we ship.

## What to report

Please tell us if a tool listed here:

- Has been taken over, or the domain has expired and been re-registered by someone else.
- Serves malware, a drive-by download, or a fake installer.
- Redirects somewhere unrelated to the product, particularly through an unexpected chain.
- Runs a phishing page, a fake login, or a credential harvester.
- Has otherwise become harmful to anyone who follows the link in good faith.

Reports about a *product's own* security (a bug inside the vendor's software) should go to
that vendor. We can only act on what this repository links to.

## How to report

**If disclosing the URL publicly could put people at risk, do not open a public issue.**
Use GitHub's private reporting instead: go to the **Security** tab and choose
*Report a vulnerability*. That opens a private advisory only maintainers can see.

If private reporting is unavailable to you, contact the maintainers through
<https://tiorai.com/contact-us/> and describe the problem without pasting a live payload URL.

For an ordinary dead or moved link with no safety angle, this is the wrong form. Open a
**Report a broken link** issue from the repository's Issues tab instead.

## What we do

We remove unsafe links first and discuss afterwards. A listing can be pulled from the README
without notice, without waiting for the vendor to respond, and without a public explanation
while a report is being checked. Removal is not an accusation — it is the cheap, reversible
option while we work out what happened.

Once resolved, the change is recorded in the changelog. Entries removed for safety reasons are
not silently re-added; they go through the normal review again.

There is no bug bounty for this repository.
