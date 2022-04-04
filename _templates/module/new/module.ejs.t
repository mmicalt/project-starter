---
to: src/<%= name %>/<%= name %>.module.ts
---
import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { <%= h.changeCase.pascal(name) %>Service } from './<%= name %>.service';
import { <%= h.changeCase.pascal(name) %>Resolver } from './<%= name %>.resolver';
import { <%= h.changeCase.pascal(name) %>, <%= h.changeCase.pascal(name) %>Schema } from './db/<%= name %>.model';

@Module({
  imports: [
      MongooseModule.forFeature([
      { name: <%= h.changeCase.pascal(name) %>.name, schema: <%= h.changeCase.pascal(name) %>Schema },
    ]),
  ],
  providers: [
    <%= h.changeCase.pascal(name) %>Resolver,
    <%= h.changeCase.pascal(name) %>Service
  ],
  exports: [
    <%= h.changeCase.pascal(name) %>Resolver,
  ],
})

export class <%= h.changeCase.pascal(name) %>Module {}
