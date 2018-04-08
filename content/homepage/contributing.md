---
title: "Contributing to Fish"
date: 2018-04-08
anchor: "contributing"
weight: 42
---

Fish accepts contributions via GitHub pull requests. This document outlines the process to help get your contribution accepted.

## Reporting a Security Issue

Most of the time, when you find a bug in Fish, it should be reported using [GitHub issues](https://github.com/fishworks/fish/issues).
However, if you are reporting a _security vulnerability_, please email a report to [Matt Fisher](mailto:matt.fisher+security-issues@fishworks.io)
directly. This will give myself a chance to try to fix the issue before it is exploited in the wild.

## Support Channels

Whether you are a user or contributor, official support channels include:

- GitHub [issues](https://github.com/fishworks/fish/issues)
- IRC - tbd at a later date

Before opening a new issue or submitting a new pull request, it's helpful to search the project - it's likely that another user has already reported the issue you're facing, or it's a known issue that we're already aware of.

## Milestones

We use milestones to track progress of releases. A milestone (and hence release) is considered done
when all outstanding issues/PRs have been closed or moved to another milestone.

## Semver

Fish maintains a strong commitment to backward compatibility. All of our changes to protocols and
formats are backward compatible from Fish 1.0 until Fish 2.0. No features, flags, or commands are
removed or substantially modified (other than bug fixes).

We also try very hard to not change publicly accessible Go library definitions inside of the `pkg/`
directory of our source code, but it is not guaranteed to be backwards compatible as we move the
project forward.

If there's some package you rely on inside of Fish that would be useful to split out and maintain
separately, [open an issue to discuss it!](https://github.com/fishworks/fish/issues/new)

For a quick summary of our backward compatibility guidelines for releases between 1.0 and 2.0:

- Command line commands, flags, and arguments MUST be backward compatible
- Directory formats within /usr/local/Fish MUST be backward compatible
- Any fish food that worked on a previous version of Fish MUST work on a new version of Fish, barring the cases where
   - it is out of our control, e.g. the Operating System itself changed, and
   - the fish food worked because it exploited a bug

## Issues

Issues are used as the primary method for tracking anything to do with the Fish project.

### Issue Types

There are 4 types of issues (each with their own corresponding [label](#labels)):

#### Question/Support

These are support or functionality inquiries that we want to have a record of for future reference.
Depending on the discussion, it may require further information from the user before these can turn
into Feature or Bug issues.

#### Proposal

Used for items that propose a new ideas or functionality that require a larger community discussion.
This allows for feedback from others in the community before a feature is actually developed. This
is not needed for small additions. Final word on whether or not a featureneeds a proposal is up to
the core maintainers. All issues that are proposals should both have a label and an issue title of
"Proposal: [the rest of the title]." A proposal can become a Feature and does not require a
milestone.

#### Feature

These track specific feature requests and ideas until they are complete. They can evolve  from a
Proposal or can be submitted individually depending on the size.

#### Bug

These track bugs with the code or problems with the documentation (i.e. missing or incomplete)

### Issue Lifecycle

The issue lifecycle is mainly driven by the core maintainers, but is good information for those 
contributing to Fish. All issue types follow the same general lifecycle. Differences are noted below.

1. Issue creation
2. Triage
    - The maintainer in charge of triaging will apply the proper labels for the issue. This 
    includes labels for priority, type, and metadata (such as "starter"). The only issue 
    priority we will be tracking is whether or not the issue is "critical." If additional 
    levels are needed in the future, we will add them.
    - (If needed) Clean up the title to succinctly and clearly state the issue. Also ensure 
    that proposals are prefaced with "Proposal".
    - Add the issue to the correct milestone. If any questions come up, don't worry about 
    adding the issue to a milestone until the questions are answered.
    - We attempt to do this process at least once per work day.
3. Discussion
    - "Feature" and "Bug" issues should be connected to the PR that resolves it. 
    - Whoever is working on a "Feature" or "Bug" issue (whether a maintainer or someone from 
    the community), should either assign the issue to them self or make a comment in the issue 
    saying that they are taking it.
    - "Proposal" and "Question" issues should stay open until resolved or if they have not been 
    active for more than 30 days. This will help keep the issue queue to a manageable size and 
    reduce noise. Should the issue need to stay open, the `keep open` label can be added.
4. Issue closure

## How to Contribute a Patch

1. Fork the desired repo, develop and test your code changes.
2. Submit a pull request.

The next section contains more information on the workflow followed for PRs

## Pull Requests

Like any good open source project, we use Pull Requests to track code changes.

### PR Lifecycle

1. PR creation
    - We more than welcome PRs that are currently in progress. They are a great way to keep track of
    important work that is in-flight, but useful for others to see. If a PR is a work in progress, 
    it **must** be prefaced with "WIP: [title]". Once the PR is ready for review, remove "WIP" from
    the title.
    - It is preferred, but not required, to have a PR tied to a specific issue.
2. Triage
    - The maintainer in charge of triaging will apply the proper labels for the issue. This should 
    include at least a size label, `bug` or `feature`, and `awaiting review` once all labels are applied. 
    See the [Labels section](#labels) for full details on the definitions of labels
    - Add the PR to the correct milestone. This should be the same as the issue the PR closes.
3. Assigning reviews
    - Once a review has the `awaiting review` label, maintainers will review them as schedule permits. 
    The maintainer who takes the issue should self-request a review.
    - Reviews from others in the community, especially those who have encountered a bug or have 
    requested a feature, are highly encouraged, but not required. Maintainer reviews **are** required 
    before any merge
    - Any PR with the `size/large` label requires 2 review approvals from maintainers before it can be 
    merged. Those with `size/medium` are per the judgement of the maintainers
4. Reviewing/Discussion
    - All reviews will be completed using Github review tool.
    - A "Comment" review should be used when there are questions about the code that should be 
    answered, but that don't involve code changes. This type of review does not count as approval.
    - A "Changes Requested" review indicates that changes to the code need to be made before they will be merged.
5. Address comments by answering questions or changing code
6. Merge or close
    - PRs should stay open until merged or if they have not been active for more than 30 days. 
    This will help keep the PR queue to a manageable size and reduce noise. Should the PR need 
    to stay open (like in the case of a WIP), the `keep open` label can be added.
    - If the owner of the PR is listed in `OWNERS`, that user **must** merge their own PRs
    or explicitly request another OWNER do that for them.
    - If the owner of a PR is _not_ listed in `OWNERS`, any core committer may
    merge the PR once it is approved.

#### A note about Documentation PRs

Documentation PRs will follow the same lifecycle as other PRs. They will also be labeled with the 
`docs` label. For documentation, special attention will be paid to spelling, grammar, and clarity 
(whereas those things don't matter *as* much for comments in code).

## Labels

The following tables define all label types used for Fish. It is split up by category.

### Common

| Label | Description |
| ----- | ----------- |
| `bug` | Marks an issue as a bug or a PR as a bugfix |
| `critical` | Marks an issue or PR as critical. This means that addressing the PR or issue is top priority and will be handled first by maintainers |
| `docs` | Indicates the issue or PR is a documentation change |
| `duplicate` | Indicates that the issue or PR is a duplicate of another |
| `feature` | Marks the issue as a feature request or a PR as a feature implementation |
| `keep open` | Denotes that the issue or PR should be kept open past 30 days of inactivity |
| `refactor` | Indicates that the issue is a code refactor and is not fixing a bug or adding additional functionality |

### Issue Specific

| Label              | Description                                                       |
|--------------------|-------------------------------------------------------------------|
| `help wanted`      | This issue is one the core maintainers would appreciate help with |
| `proposal`         | This issue is a proposal                                          |
| `question/support` | This issue is a support request or question                       |
| `good first issue` | This issue is a good for someone new to contributing to Fish      |
| `wontfix`          | The issue has been discussed and will not be accepted             |

### Release Specific

| Label | Description |
| ----- | ----------- |
| `needs pick` | Indicates that the PR needs to be picked into a feature branch (generally bugfix branches). Once it has been, the `picked` label should be applied and this one removed |
| `picked` | This PR has been picked into a feature branch |
