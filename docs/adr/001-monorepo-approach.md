# ADR-001: Monorepo Approach

## Status
Proposed - Will try no tool approach first

## Context
- Need monorepo architecture for managing multiple products
- Backend uses Python and Go
- Frontend uses TypeScript
- Require flexibility to split/merge projects in the future
- Need to avoid tight coupling between services
- Want to keep tech stack simple and minimal

## Decision
Start with no monorepo tool approach (Make + Scripts) to keep tech stack lean, then evaluate if we need dedicated tooling

## Consequences

### Positive
- No additional abstraction layer to learn
- Full control over build processes
- Minimal tech stack complexity
- Easy to understand and maintain
- No vendor lock-in
- Can always add tooling later if needed

### Negative
- No intelligent caching
- Manual dependency tracking
- No affected commands
- Limited scalability for large teams
- More manual configuration required

### Neutral
- Need to create custom scripts for common operations
- Team responsible for maintaining build infrastructure

## Alternatives Considered

| Tool | Pros | Cons | Verdict |
|------|------|------|---------|
| **No Tool**<br>(Make + Scripts) | • No abstraction<br>• Full control<br>• No learning curve<br>• Minimal tech stack | • No intelligent caching<br>• Manual dependency tracking<br>• No affected commands<br>• Poor scalability | ✅ **Selected**<br>Start simple, add complexity when needed |
| **Nx** | • Excellent TypeScript support<br>• Plugin architecture for Python/Go<br>• Smart caching & affected commands<br>• Good developer experience<br>• Dependency visualization | • Python/Go via community plugins<br>• Additional abstraction layer<br>• Learning curve for Nx concepts | 🔄 **Future consideration**<br>If simple approach becomes insufficient |
| **Bazel** | • True polyglot support<br>• Hermetic builds<br>• Google-scale proven<br>• Fine-grained dependency tracking | • Very steep learning curve<br>• Complex configuration<br>• Overkill for our scale<br>• Poor developer experience | ❌ Too complex |
| **Turborepo** | • Simple configuration<br>• Fast builds<br>• Good for JS/TS<br>• Low learning curve | • Limited Python/Go support<br>• JS-centric design<br>• Less extensible than Nx | ❌ Insufficient polyglot support |

## Migration Path
If the simple approach becomes insufficient, we can migrate to Nx as the next step, given its good balance of features and complexity.
