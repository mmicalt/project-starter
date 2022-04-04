---
to: src/<%= name %>/db/<%= name %>.model.ts
---
import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

@Schema({
  collection: '<%= h.changeCase.kebab(name) %>s',
  timestamps: true,
  toJSON: { virtuals: true, getters: true },
  toObject: { virtuals: true, getters: true },
})
export class <%= h.changeCase.pascal(name) %> {
  id: string;
}

export type <%= h.changeCase.pascal(name) %>Document = <%= h.changeCase.pascal(name) %> & Document;

export const <%= h.changeCase.pascal(name) %>Schema = SchemaFactory.createForClass(<%= h.changeCase.pascal(name) %>);
