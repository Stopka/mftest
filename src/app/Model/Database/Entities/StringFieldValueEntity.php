<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 15:52
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\ORM\Mapping as ORM;

/**
 * Class StringFieldValueEntity
 * @package Stopka\MediaFactory\Model\Database\Entities
 * @ORM\Entity()
 */
class StringFieldValueEntity extends FieldValueEntity
{

    /**
     * @var string|null
     * @ORM\Column(type="string", nullable=true)
     */
    private $value;

    public function __construct(StringFieldEntity $field, ?string $value)
    {
        parent::__construct($field);
        $this->value = $value;
    }

    /**
     * @return string|null
     */
    public function getValue(): ?string
    {
        return $this->value;
    }

    /**
     * @param string|null $value
     */
    public function setValue(?string $value): void
    {
        $this->value = $value;
    }

}
