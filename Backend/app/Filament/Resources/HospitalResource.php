<?php

namespace App\Filament\Resources;

use App\Filament\Resources\HospitalResource\Pages;
use App\Filament\Resources\HospitalResource\RelationManagers;
use App\Models\Hospital;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class HospitalResource extends Resource
{
    protected static ?string $model = Hospital::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')->required(),
                Forms\Components\TextInput::make('email')->email()->required(),
                Forms\Components\TextInput::make('phone_number')->required(),
                Forms\Components\TextInput::make('location')->required(),
                Forms\Components\Select::make('category_id')
                ->relationship('category', 'name')
                ->required(),
                Forms\Components\Textarea::make('description')
                ->required()->rows(10)
                ->cols(20),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')->sortable()->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('category_id')->sortable()->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('name')->sortable()->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('email')->sortable()->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('phone_number')->sortable()->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('description')->sortable()->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('location')->sortable()->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('category.title')
                ->label('Category')
                ->sortable()
                ->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('created_at')->sortable()->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('updated_at')->sortable()->searchable()->alignment('center'),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListHospitals::route('/'),
            'create' => Pages\CreateHospital::route('/create'),
            'view' => Pages\ViewHospital::route('/{record}'),
            'edit' => Pages\EditHospital::route('/{record}/edit'),
        ];
    }
}
