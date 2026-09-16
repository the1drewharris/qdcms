# QDCMS

The platform behind **QuantumDelta**, a B2B SaaS company I founded in Tulsa,
Oklahoma in December 2001 and ran for eleven years.

The name says CMS. It was considerably more than that: a multi-tenant business
platform that let non-technical small businesses run their operations without
hiring anybody technical.

## What was in it

- **Content** — pages, blog, forum, surveys, contests, link directories, navigation
- **Commerce** — products, orders, subscriptions
- **CRM** — address book, contacts, and event registration
- **Marketing** — newsletters, ad management, and "how did you hear about us" attribution
- **Media** — image, audio, file and video libraries, with a built-in Flash video
  player. Customers were running hosted video libraries while YouTube was still
  a toddler
- **Task and incident management** — projects, trouble tickets, error handling
- **Administration** — users, roles, sections, sites, modules, patches, mail server

The schema is the part I am still a little proud of. `QD_MODULES_TO_SITE`,
`QD_MODULES_TO_ROLE` and `QD_MODULES_TO_USER` mean modules were licensed and
entitled per tenant, per role and per user. Multi-tenant SaaS with feature
entitlements and role-based access, written in ColdFusion, starting in 2001.

## Why it is public

By 2012 I had decided to wind QuantumDelta down.

Hundreds of businesses ran their day-to-day operations on this — not their
website, their *operation*: the storefront, the customer list, the event
registrations, the newsletter, the support tickets. One customer had grown from
a single location to more than a hundred franchises on it. Losing the vendor
would not have meant losing a website.

So the ordinary move — sell the customer list and move on — was not available to
me in good conscience. I released the source instead, and spent about a year
closing the company deliberately rather than quickly, so that every client had
somewhere to go and somebody who could keep it running for them, and every
employee had somewhere to land.

I am not aware of anyone still running it. It stays public in case it is ever
useful to someone.

## What this is

An archive of the production web root as it stood, not a curated release.
Mostly ColdFusion (`.cfm`, `.cfc`), with JavaScript, and some PHP and ASP.

## What this is not

- **Not maintained.** No support, no issue triage, no releases, no roadmap.
- **Not a drop-in install.** There is no setup script and no dependency
  manifest. It expects a ColdFusion application server and a database that are
  not described here. `tables.cfm` is the closest thing to a schema.
- **Not secure by modern standards.** This was written between 2001 and 2012.
  Read it as history, or for parts. Do not put it on the public internet as-is.

## License

MIT — see [LICENSE](LICENSE). Use it, fork it, take pieces of it.

---

Drew Harris · [the1drewharris.com](https://the1drewharris.com) ·
now building [Apex Replicant](https://apexreplicant.com)
