---
to: src/<%= name %>/<%= name %>.resolver.ts
---
import { Resolver, Query, Args } from '@nestjs/graphql';
import { <%= h.changeCase.pascal(name) %> } from './entities/<%= name %>.entity';
import { <%= h.changeCase.pascal(name) %>Service } from './<%= name %>.service';

@Resolver(() => <%= h.changeCase.pascal(name) %>)
export class <%= h.changeCase.pascal(name) %>Resolver {
  constructor(private readonly <%= h.changeCase.camel(name) %>Service: <%= h.changeCase.pascal(name) %>Service) {}

  @Query(() => <%= h.changeCase.pascal(name) %>)
  get<%= h.changeCase.pascal(name) %>ById(
    @Args('id')
    id: string,
  ): Promise<<%= h.changeCase.pascal(name) %>> {
    return this.<%= h.changeCase.camel(name) %>Service.get<%= h.changeCase.pascal(name) %>ById(id);
  }
}
