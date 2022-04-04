---
to: src/<%= name %>/entities/<%= name %>.entity.ts
---
import { ObjectType, Field } from '@nestjs/graphql';
import { <%= h.changeCase.pascal(name) %>Document } from '../db/<%= name %>.model';


@ObjectType()
export class <%= h.changeCase.pascal(name) %> {
  constructor(data: Partial<<%= h.changeCase.pascal(name) %> & { _id?: string }>) {
    Object.assign(this, {
      ...data,
      id: data.id || data._id,
    });
  }

  @Field()
  id: string;


  static fromDocument(document: <%= h.changeCase.pascal(name) %>Document): <%= h.changeCase.pascal(name) %> {
    return new <%= h.changeCase.pascal(name) %>({
      ...document.toObject(),
    });
  }

}
