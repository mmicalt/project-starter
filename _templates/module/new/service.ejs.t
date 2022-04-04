---
to: src/<%= name %>/<%= name %>.service.ts
---
import { Injectable } from '@nestjs/common';
import { Model } from 'mongoose';
import { InjectModel } from '@nestjs/mongoose';
import {
  <%= h.changeCase.pascal(name) %> as <%= h.changeCase.pascal(name) %>ModelDefinition,
  <%= h.changeCase.pascal(name) %>Document,
} from './db/<%= name %>.model';
import { <%= h.changeCase.pascal(name) %> } from './entities/<%= name %>.entity';
import { EntityNotFound } from '../util/errors';

@Injectable()
export class <%= h.changeCase.pascal(name) %>Service {
  constructor(
    @InjectModel(<%= h.changeCase.pascal(name) %>ModelDefinition.name)
    private <%= h.changeCase.pascal(name) %>Model: Model<<%= h.changeCase.pascal(name) %>Document>,
  ) {}

  public async get<%= h.changeCase.pascal(name) %>ById(id: string): Promise<<%= h.changeCase.pascal(name) %>> {
    const document = await this.<%= h.changeCase.pascal(name) %>Model.findById(id);

    if (!document) {
      throw EntityNotFound(<%= h.changeCase.pascal(name) %>.name);
    }

    return <%= h.changeCase.pascal(name) %>.fromDocument(document);
  }
}
