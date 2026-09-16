# QDCMS

The content management system behind **QuantumDelta**, a B2B SaaS company I
founded in Tulsa, Oklahoma in December 2001 and ran for eleven years.

## Why it is public

By 2012 I had decided to wind QuantumDelta down.

Hundreds of businesses ran their day-to-day operations on this software. One
customer had grown from a single location to more than a hundred franchises on
it. The ordinary move at that point is to sell the customer list and move on.

I released the source instead, and spent about a year closing the company
deliberately rather than quickly — so that every client had somewhere to go and
somebody who could keep the software running for them, and every employee had
somewhere to land.

I am not aware of anyone still running it. It stays public in case it is ever
useful to someone.

## What this is

An archive of the production web root as it stood, not a curated release.
Mostly ColdFusion (`.cfm`), with JavaScript, and some PHP and ASP alongside it.

- `public_html/` — the application itself
- `logs/`, `stats/` — web server artifacts that came along with the directory

## What this is not

- **Not maintained.** No support, no issue triage, no releases, no roadmap.
- **Not a drop-in install.** There is no setup script and no dependency
  manifest. It expects a ColdFusion application server and a database that are
  not described here.
- **Not secure by modern standards.** This was written between 2001 and 2012.
  Read it as history, or for parts. Do not put it on the public internet as-is.

## License

MIT — see [LICENSE](LICENSE). Use it, fork it, take pieces of it.

---

Drew Harris · [the1drewharris.com](https://the1drewharris.com) ·
now building [Apex Replicant](https://apexreplicant.com)
